
<%@ page import="com.dtolabs.ndb.Node" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${flash.editError}">
                <g:javascript>
                    if(window.self!=window.parent){
                        window.parent.postMessage("rundeck:node:edit:error:${flash.editError.encodeAsJavaScript()}","http://localhost:9090");
                         }
                </g:javascript>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'node.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'node.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="hostname" title="${message(code: 'node.hostname.label', default: 'Hostname')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'node.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="osFamily" title="${message(code: 'node.osFamily.label', default: 'Os Family')}" />
                        
                            <g:sortableColumn property="osVersion" title="${message(code: 'node.osVersion.label', default: 'Os Version')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${nodeInstanceList}" status="i" var="nodeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${nodeInstance.id}">${fieldValue(bean: nodeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: nodeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: nodeInstance, field: "hostname")}</td>
                        
                            <td>${fieldValue(bean: nodeInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: nodeInstance, field: "osFamily")}</td>
                        
                            <td>${fieldValue(bean: nodeInstance, field: "osVersion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${nodeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
