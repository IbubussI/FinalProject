<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="content" type="java.lang.String" required="true" %>
<c:if test="${empty requestScope.suffix}">
    <c:set var="suffix" value="0" scope="request"/>
</c:if>
<c:set var="suffix" value="${requestScope.suffix + 1}" scope="request"/>
<c:if test="${not empty content}">
    <button class="modal-button" id="modal-button${requestScope.suffix}" onclick="openModal(${requestScope.suffix})">
            ${content}
    </button>
    <div id="modal-box${requestScope.suffix}" class="modal-box">
        <div class="modal-frame">
            <div class="modal-close" onclick="closeModal(${requestScope.suffix})">
                &times;
            </div>
            <div id="modal-content${requestScope.suffix}" class="modal-content"></div>
        </div>
    </div>
</c:if>


