<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'todo.label', default: 'Todo')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-todo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-todo" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>




                    <table>
                     <thead>
                       <th>title</th>
                       <th>Description</th>
                       <th>Collaborators</th>
                       <th>Author</th>
                       <th>Elements</th>
                       <th>Action</th>
                     </thead>
                    <tbody>
                    <g:each in="${todoList}" var="todo">
                        <tr>
                            <td>
                                <g:link action="show" id="${todo.id}">${todo.title}</g:link>

                            <td>${todo.description}</td>
                            <td>
                                <g:each in="${todo.collaborators}" var="collaborator">
                                    ${collaborator.username}<br />
                                </g:each>
                                <g:if test="${todo.author != user}">
                                    <br><p>Permission sur le TODO <br></p>
                                    <g:each in="${todo.permissions}" var="permission">
                                        ${permission.role}<br />
                                    </g:each>

                                </g:if>
                            </td>
                            <td>${todo.author.username}</td>
                            <td>
                                <g:each in="${todo.elements}" var="element">
                                    ${element.title}<br />
                                </g:each>
                            </td>

                            <td>

                                <g:if test="${todo.author != user}">
                                    <div>vous ne pouvez pas ajouter des collaborateurs</div>

                                </g:if>

                                <g:if test="${todo.author == user && !(todo.collaborators.contains(user)) }">

                                    <a href="/todo/addCollaborator?todoId=${todo.id}">Ajouter collaborateur</a>

                                </g:if>
                                <g:form resource="${todo}" method="DELETE">
                                    <fieldset class="buttons">
                                        <g:link class="edit" action="edit" resource="${todo}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    </fieldset>
                                </g:form>
                            </td>
                        </tr>
                    </g:each>


                    </tbody>
                </table>

                    <g:if test="${todoCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${todoCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>