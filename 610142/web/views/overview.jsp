<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>
<link rel="stylesheet" href="resources/overview.css">

<div class="container">
    <div class="flex-container">
        <h4 class="teachers-result" id="found-teacher-count"><span><strong>3</strong> teachers found</span></h4>
        <div class="teachers-list">
            <div class="teachers">
                <c:forEach items="${teachers}" var="teacher">
                    <div class="teacher-card" onclick="location.href='/detail.do?teacherId=${teacher.teacherId}';">
                        <div class="teacher-card-left">
                            <div class="teacher-card-detail-top">
                                <div class="teacher-card-avatar">
                                    <div class="avatar avatar-big avatar-shadow avatar-placeholder" url="T058107780">
                                        <img src="https://scontent.ffod1-1.fna.fbcdn.net/v/t1.0-1/p320x320/50995047_2200438226885784_5050945694022500352_n.jpg?_nc_cat=102&_nc_oc=AQmHhEC2rfHAG0OiJngc4onjlpbj4C7t6ZCNtvJMKkUFaVyOYML7HfNFSkOuu_lnOTs&_nc_ht=scontent.ffod1-1.fna&oh=9e67138b99402dd33d05ccf8842b24c8&oe=5DEB02BC"
                                             alt="Avatar"></div>
                                </div>
                                <div class="teacher-card-information"><h1>
                                    <span>${teacher.firstName} ${teacher.lastName}</span><i
                                        class="flag flag-gb"></i>
                                </h1>
                                    <p><span>Professional Teacher</span></p>
                                    <div class="teacher-card-divider"></div>
                                    <p><span>Teaches</span></p>
                                    <h2><span>
                                        <c:forEach items="${teacher.teachLanguages}" var="language">
                                            <span>${language}</span>
                                        </c:forEach>
                                    </span></h2></div>
                            </div>
                            <div class="teacher-card-detail-bottom">
                                <div class="teacher-card-rating">
                                    <div class="teacher-card-stars">
                                        <div class="stars-box">
                                            <span class="star"></span>
                                            <span class="star"></span>
                                            <span class="star"></span>
                                            <span class="star"></span>
                                            <span class="star"></span>
                                        </div>
                                    </div>
                                    <p><span>${teacher.lessonTotalNum} LESSONS</span></p>
                                </div>
                                <div class="teacher-card-information">
                                    <div class="teacher-card-rate">
                                        <div class="teacher-card-hourly"><p><span>Hourly Rate From</span></p>
                                            <h2 class="teacher-price-rate"><span>USD 20.00</span></h2></div>
                                        <div class="teacher-card-trial"><p><span>Trial</span></p>
                                            <h2 class="teacher-price-rate"><span>USD 8.00</span></h2></div>
                                    </div>
                                </div>
                                <i class="teacher-card-favorite"></i>
                            </div>
                        </div>
                        <div class="teacher-card-right">
                            <div class="teacher-card-tab-head">
                                <div class="teacher-card-tabs">
                                    <div class="teacher-card-tab"><p><span>Video</span></p></div>
                                    <div class="teacher-card-tab"><p><span>Intro</span></p></div>
                                    <div class="teacher-card-tab"><p><span>Calendar</span></p></div>
                                    <div class="teacher-card-tab-active"
                                         style="left: 0px; bottom: 20px; width: 36px;"></div>
                                </div>
                            </div>
                            <div class="teacher-card-tab-body">
                                <div class="teacher-card-video">
                                    <div class="iframe-video">
                                        <div class="video-player"><img
                                                src="https://img.youtube.com/vi/MmxOL0OY6XA/0.jpg" alt="poster">
                                            <div class="video-poster-overlay"><i class="video-play-icon"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <p>
        <font color="red">${errorMessage}</font>
    </p>
</div>
<%@ include file="../common/footer.jspf" %>