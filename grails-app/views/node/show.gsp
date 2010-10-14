
<%@ page import="com.dtolabs.ndb.Node" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${flash.saved}">
            <g:javascript>
                if(window.self!=window.parent){
                         window.parent.postMessage("rundeck:node:edit:finished:true","http://localhost:9090");                
                         }
            </g:javascript>
            </g:if>
            <g:else>
            <g:javascript>
                if(window.self!=window.parent){
                         window.parent.postMessage("rundeck:node:edit:finished:false","http://localhost:9090");                
                         }
            </g:javascript>
            </g:else>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.hostname.label" default="Hostname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "hostname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.osFamily.label" default="Os Family" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "osFamily")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.osVersion.label" default="Os Version" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "osVersion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.osArch.label" default="Os Arch" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "osArch")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.osName.label" default="Os Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "osName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="node.project.label" default="Project" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: nodeInstance, field: "project")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${nodeInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
