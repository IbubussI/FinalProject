<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ralib" uri="http://repairagency.com/taglib" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="${pageContext.request.contextPath}/styles/master-requests.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/styles/common.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/title.png" type="image/icon">
    <title>Assigned Requests</title>
    <script>
        function submitForm() {
            document.getElementById("request-query").submit();
        }

        function setPage(x) {
            document.getElementById("page").value = x;
            submitForm();
        }

        function nextPage() {
            let page = document.getElementById("page").value;
            page++;
            document.getElementById("page").value = page;
            submitForm();
        }

        function prevPage() {
            let page = document.getElementById("page").value;
            page--;
            document.getElementById("page").value = page;
            submitForm();
        }

        function setSize(x) {
            document.getElementById("size").value = x;
            document.getElementById("page").value = 0;
            submitForm();
        }
    </script>
    <jsp:include page="/WEB-INF/jspf/modal-box-scripts.jspf"/>
</head>
<body>
<my:navBar/>
<ralib:onRequest command="get-master-requests"/>
<div class="row">
    <div class="column-middle">
        <div class="column-middle-left">
            <form method="get" action="${pageContext.request.requestURI}" id="request-query">
                <input type="hidden" name="command" value="get-manager-requests"/>
                <input type="hidden" id="size" name="size" value="${pageContext.request.getParameter('size')}"/>
                <input type="hidden" id="page" name="page" value="${pageContext.request.getAttribute('page')}"/>
                <div class="dropdown-filters-outer">
                    <div class="filter-status-frame">
                        <label>
                            Filter by status:
                            <select name="filter-status" class="select-css" onchange="this.form.submit()">
                                <c:set var="filter" value="${pageContext.request.getParameter('filter-status')}"/>
                                <option value="none"
                                        <c:if test="${filter == 'none'}">
                                            selected
                                        </c:if>>
                                    none
                                </option>
                                <option value="paid"
                                        <c:if test="${filter == 'paid'}">
                                            selected
                                        </c:if>>
                                    Paid
                                </option>
                                <option value="in-process"
                                        <c:if test="${filter == 'in-process'}">
                                            selected
                                        </c:if>>
                                    In process
                                </option>
                                <option value="done"
                                        <c:if test="${filter == 'done'}">
                                            selected
                                        </c:if>>
                                    Done
                                </option>
                            </select>
                        </label>
                    </div>
                    <div class="sort-frame">
                        <label>
                            Sort by:
                            <select name="sort-factor" class="select-css" onchange="this.form.submit()">
                                <c:set var="sortFactor" value="${pageContext.request.getParameter('sort-factor')}"/>
                                <option value="id"
                                        <c:if test="${sortFactor == 'id'}">
                                            selected
                                        </c:if>>
                                    ID
                                </option>
                                <option value="creation-date"
                                        <c:if test="${sortFactor == 'creation-date'}">
                                            selected
                                        </c:if>>
                                    Creation Date
                                </option>
                                <option value="status"
                                        <c:if test="${sortFactor == 'status'}">
                                            selected
                                        </c:if>>
                                    Status
                                </option>
                                <option value="completion-date"
                                        <c:if test="${sortFactor == 'completion-date'}">
                                            selected
                                        </c:if>>
                                    Completion Date
                                </option>
                            </select>
                        </label>
                    </div>
                </div>
                <div class="order-frame toggle-radio">
                    <my:tableSortOrder/>
                </div>
            </form>
        </div>
        <div class="column-middle-right table-control">
            <div class="page-frame">
                <my:tablePageNav/>
            </div>
            <div class="size-frame">
                <my:tablePageSize/>
            </div>
        </div>
        <table class="req-table">
            <caption>Request history:</caption>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Status</th>
                <th scope="col">Creation Date</th>
                <th scope="col">Completion Date</th>
                <th scope="col">Description</th>
                <th scope="col">Feedback</th>
                <th scope="col">Actions</th>
            </tr>
            <c:forEach var="row" items="${requestScope.requests}">
                <tr>
                    <td>${row.id}</td>
                    <td>${row.status}</td>
                    <td>${row.creationDate}</td>
                    <td>${row.completionDate}</td>
                    <td><my:modal content="${row.description}" buttonStyle="table-cell-button"/></td>
                    <td><my:modal content="${row.userReview}" buttonStyle="table-cell-button"/></td>
                    <td>
                        <form method="get"
                              action="${pageContext.request.contextPath}/main/role-dependent/master/request-info.jsp">
                            <input type="hidden" name="command" value="get-request">
                            <label>
                                <button class="action-button" name="request-id" value="${row.id}">
                                    <c:choose>
                                        <c:when test="${row.status.name().equals('DONE')}">
                                            Info
                                        </c:when>
                                        <c:otherwise>
                                            Edit
                                        </c:otherwise>
                                    </c:choose>
                                </button>
                            </label>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>