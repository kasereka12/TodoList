<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="edit-user" class="col-12 content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.user}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <form action="/user/update/2" method="post">
                        <!-- Simuler le PUT avec un champ _method -->
                        <input type="hidden" name="_method" value="PUT" id="_method" />

                        <!-- Version de l'utilisateur pour la gestion des versions en Grails -->
                        <input type="hidden" name="version" value="1" id="version" />

                        <fieldset class="form">
                            <!-- Password -->
                            <div class="form-group">
                                <label for="password">Password
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="password" name="password" value="" required="" id="password" class="form-control" />
                            </div>

                            <!-- Username -->
                            <div class="form-group">
                                <label for="username">Username
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="username" value="Younesse" required="" id="username" class="form-control" />
                            </div>

                            <!-- Password Expired -->
                            <div class="form-check">
                                <input type="hidden" name="_passwordExpired" />
                                <input type="checkbox" name="passwordExpired" id="passwordExpired" class="form-check-input" />
                                <label for="passwordExpired" class="form-check-label">Password Expired</label>
                            </div>

                            <!-- Permissions -->
                            <div class="form-group">
                                <label for="permissions">Permissions</label>
                                <ul class="list-unstyled">
                                    <!-- Dynamically load permissions here -->
                                </ul>
                                <a href="/permission/create?user.id=2" class="btn btn-link">Add Permission</a>
                            </div>

                            <!-- Account Locked -->
                            <div class="form-check">
                                <input type="hidden" name="_accountLocked" />
                                <input type="checkbox" name="accountLocked" id="accountLocked" class="form-check-input" />
                                <label for="accountLocked" class="form-check-label">Account Locked</label>
                            </div>

                            <!-- Todos -->
                            <div class="form-group">
                                <label for="todos">Todos</label>
                                <ul class="list-unstyled">
                                    <!-- Example Todo (dynamically load todos here) -->
                                    <li><a href="/todo/show/1">emsi.mbds.todolist.Todo : 1</a></li>
                                </ul>
                                <a href="/todo/create?user.id=2" class="btn btn-link">Add Todo</a>
                            </div>

                            <!-- Account Expired -->
                            <div class="form-check">
                                <input type="hidden" name="_accountExpired" />
                                <input type="checkbox" name="accountExpired" id="accountExpired" class="form-check-input" />
                                <label for="accountExpired" class="form-check-label">Account Expired</label>
                            </div>

                            <!-- Enabled -->
                            <div class="form-check">
                                <input type="hidden" name="_enabled" />
                                <input type="checkbox" name="enabled" checked="checked" id="enabled" class="form-check-input" />
                                <label for="enabled" class="form-check-label">Enabled</label>
                            </div>
                        </fieldset>

                        <fieldset class="buttons mt-3">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </fieldset>
                    </form>

                </div>
            </section>
        </div>
    </div>
    </body>
</html>
