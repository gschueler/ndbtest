

<%@ page import="com.dtolabs.ndb.Node" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${nodeInstance}">
            <div class="errors">
                <g:renderErrors bean="${nodeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="node.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${nodeInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hostname"><g:message code="node.hostname.label" default="Hostname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'hostname', 'errors')}">
                                    <g:textField name="hostname" value="${nodeInstance?.hostname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="node.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${nodeInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="osFamily"><g:message code="node.osFamily.label" default="Os Family" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'osFamily', 'errors')}">
                                    <g:textField name="osFamily" value="${nodeInstance?.osFamily}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="osVersion"><g:message code="node.osVersion.label" default="Os Version" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'osVersion', 'errors')}">
                                    <g:textField name="osVersion" value="${nodeInstance?.osVersion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="osArch"><g:message code="node.osArch.label" default="Os Arch" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'osArch', 'errors')}">
                                    <g:textField name="osArch" value="${nodeInstance?.osArch}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="osName"><g:message code="node.osName.label" default="Os Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'osName', 'errors')}">
                                    <g:textField name="osName" value="${nodeInstance?.osName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="project"><g:message code="node.project.label" default="Project" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: nodeInstance, field: 'project', 'errors')}">
                                    <g:textField name="project" value="${nodeInstance?.project}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
