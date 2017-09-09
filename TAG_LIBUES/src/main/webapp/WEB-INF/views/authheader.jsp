<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="text-right">
   Bienvenido: <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('USUARIO') or hasRole('DBA') or hasRole('BODEGUERO') or hasRole('VENDEDOR') or hasRole('DIRECTOR')"><strong>${loggedinuser}</strong></sec:authorize> 
    <sec:authorize access="hasRole('ADMINISTRADOR') or hasRole('USUARIO') or hasRole('DBA') or hasRole('BODEGUERO') or hasRole('VENDEDOR') or hasRole('DIRECTOR')"><a class="btn btn-default" role="button" href="<c:url value="/logout" />">Salir</a></sec:authorize>
    <sec:authorize access="isAuthenticated()" var="isAuthenticated" />
		<c:if test="${not isAuthenticated}">
  			<a  class="btn btn-primary" role="button" href="<c:url value="/login" />">Identificarse</a>
		</c:if>
</div>