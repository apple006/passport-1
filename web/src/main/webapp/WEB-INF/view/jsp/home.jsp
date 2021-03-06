<%@ include file="common/taglibs.jsp" %>
<head>
    <title><fmt:message key="mainMenu.heading"/></title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="menu" content="MainMenu"/>
    <!-- <link rel="stylesheet" type="text/css" media="all" href="/statics/styles/default/theme.css" /> -->
</head>
<body id="login">
    <div class="main wrapper">
        <div class="sidebar">
            <div class="side_bg1"></div>
        </div>
        <div class="login_con">
            <div class="login" id="login">
                <h3><spring:message code="screen.success.header" /></h3>
                <div class="logined">
                    <dl>
						<dd class="avatar">
								<img src="${userForm.avataUrl}">
						</dd>
						<dt>
                            <strong><%=request.getUserPrincipal().getName()%></strong> <span><fmt:message key="mainMenu.heading" /></span>
                        </dt>
                        <dt>
                            <c:out value="${userForm.email}" escapeXml="false"/>
                            <appfuse:constants />
							<c:choose>
								<c:when test="${fn:contains(userForm.state, STATES_EMAIL_VERIFIED)}">
                                    <span><fmt:message key="user.activation" /></span>
								</c:when>
								<c:otherwise>
	                                <form id="activation" action="<c:url value="/hint?username=${userForm.username}&activation"/>" method="POST">
	                                    <c:if test="${userForm.send == false}"><button type="submit"><span><fmt:message key="user.activated" /></span></button></c:if>
	                                </form>
								</c:otherwise>
							</c:choose>
						</dt>
                    </dl>
                </div>
                <div class="login_manage">
                    <h4><fmt:message key="mainMenu.message"/></h4>
                </div>
                <div class="login_record">
	                <p><a href="<c:url value='/userform'/>"><fmt:message key="menu.user" /></a></p>
	                <p><a href="<c:url value='/userform?from=realauth'/>"><fmt:message key="menu.real.auth" /></a></p>
	                <p><a href="/logout"><fmt:message key="user.logout"/></a></p>
	                <p><form id="disconnect" action="/connect/weibo" method="post">
							<button type="submit">Disconnect</button>	
							<input type="hidden" name="_method" value="delete" />
						</form></p>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</body>