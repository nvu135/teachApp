<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>
<link rel="stylesheet" href="resources/overview.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">

    <div class="flex-container lessons">
        <div class="teachers-list">
            <div class="teachers">
                <c:forEach items="${lessonItems}" var="lessonItem">
                    <div class="teacher-card">
                    <div class="teacher-card-left">
                        <div class="teacher-card-detail-top">
                            <div class="teacher-card-information"><h1>
                                <span>${lessonItem.lesson.name}</span><i
                                    class="flag flag-gb"></i>
                            </h1>

                                <p><span>Description</span></p>
                                <h2>${lessonItem.lesson.description}</h2>

                                <div class="teacher-card-divider"></div>
                                <p><span>Period</span></p>
                                <h2>Start :  <span> ${lessonItem.period.start}</span></h2>
                                <h2>End :  <span> ${lessonItem.period.end}</span></h2>

                            </div>
                        </div>

                        <div class="teacher-card-information">
                            <p><span>Teacher ID ${lessonItem.teacherId}</span></p>
                            <div class="teacher-card-rate">
                                <div class="teacher-card-hourly"><p><span>Hourly Rate</span></p>
                                    <h2 class="teacher-price-rate"><span>${lessonItem.lesson.rate} USD/HOUR</span></h2></div>
                            </div>
                        </div>
                    </div>

                </div>
                </c:forEach>
            </div>

        </div>
    </div>

</div>
<%@ include file="../common/footer.jspf" %>