package com.dtolabs.ndb

class NodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [nodeInstanceList: Node.list(params), nodeInstanceTotal: Node.count()]
    }

    def create = {
        def nodeInstance = new Node()
        nodeInstance.properties = params
        return [nodeInstance: nodeInstance]
    }

    def save = {
        def nodeInstance = new Node(params)
        if (nodeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'node.label', default: 'Node'), nodeInstance.id])}"
            redirect(action: "show", id: nodeInstance.id)
        }
        else {
            render(view: "create", model: [nodeInstance: nodeInstance])
        }
    }

    def show = {
        def nodeInstance = findNode(params)
        if (!nodeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'node.label', default: 'Node'), params.id])}"
            redirect(action: "list")
        }
        else {
            [nodeInstance: nodeInstance]
        }
    }

    def edit = {
        def nodeInstance = findNode(params)
        if (nodeInstance) {
            return [nodeInstance: nodeInstance]
        }
    }
    
    def findNode={params->
        def nodeInstance 
        def usedparams=''
        if(params.id){
            nodeInstance = Node.get(params.id)
            usedparams=params.id
        }
        if(nodeInstance){
            return nodeInstance
        }
        
        if(params.name && params.project){
            nodeInstance = Node.findByNameAndProject(params.name,params.project)
            usedparams=params.name+", project: "+params.project
        }else if(params.name && !params.project){
            nodeInstance = Node.findByName(params.name)
            usedparams=params.name
        }
        if(!nodeInstance){
           flash.message = message(code: 'default.not.found.message', args: [message(code: 'node.label', default: 'Node'), usedparams])
            flash.editError=flash.message
            redirect(action: "list")
        }
        return nodeInstance
        
    }

    def update = {
        def nodeInstance = Node.get(params.id)
        if (nodeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (nodeInstance.version > version) {
                    
                    nodeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'node.label', default: 'Node')] as Object[], "Another user has updated this Node while you were editing")
                    render(view: "edit", model: [nodeInstance: nodeInstance,editError:"Another user has updated this Node while you were editing"])
                    return
                }
            }
            nodeInstance.properties = params
            if (!nodeInstance.hasErrors() && nodeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'node.label', default: 'Node'), nodeInstance.id])}"
                flash.saved=nodeInstance.name
                redirect(action: "show", id: nodeInstance.id)
            }
            else {
                render(view: "edit", model: [nodeInstance: nodeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'node.label', default: 'Node'), params.id])}"
            flash.error=flash.message
            redirect(action: "list")
        }
    }

    def delete = {
        def nodeInstance = Node.get(params.id)
        if (nodeInstance) {
            try {
                nodeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'node.label', default: 'Node'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'node.label', default: 'Node'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'node.label', default: 'Node'), params.id])}"
            redirect(action: "list")
        }
    }
}
