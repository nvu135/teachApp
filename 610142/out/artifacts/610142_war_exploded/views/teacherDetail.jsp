<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>
<link href='https://fullcalendar.io/releases/core/4.2.0/main.min.css' rel='stylesheet'/>
<link href='https://fullcalendar.io/releases/daygrid/4.2.0/main.min.css' rel='stylesheet'/>
<link href='https://fullcalendar.io/releases/timegrid/4.2.0/main.min.css' rel='stylesheet'/>
<link rel="stylesheet" href="resources/detail.css">
<script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

<script src='https://fullcalendar.io/releases/core/4.2.0/main.min.js'></script>
<script src='https://fullcalendar.io/releases/daygrid/4.2.0/main.min.js'></script>
<script src='https://fullcalendar.io/releases/timegrid/4.2.0/main.min.js'></script>
<script src='https://fullcalendar.io/releases/interaction/4.2.0/main.min.js'></script>

<script>
    $(document).ready(function () {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: ['interaction', 'timeGrid'],
            selectable: true,
            titleRangeSeparator: "-",
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'timeGridWeek'
            },
            defaultDate: '2019-07-17',
            events: [
                <c:forEach items="${teacher.availableTime}" var="period">
                {
                    start: '${period.start}',
                    end: '${period.end}',
                    rendering: 'background',
                    color: '#52ff65',
                    available: true
                },
                </c:forEach>
            ],
            select: function (info) {
                var event = {start: info.startStr, end: info.endStr};
                calendar.addEvent(event);

                $.post('detail.do', {
                    start: info.startStr,
                    end: info.endStr,
                    teacherId: "${teacher.teacherId}"
                }, function (responseText) {
                    console.log(responseText);
                    $("#lessons-link").show();
                });

            }
        });

        $('#calendarModal').on('shown.bs.modal', function () {
            calendar.setOption('height', $(".modal-content", "#calendarModal").height() - 100);

            if (!$('#calendar').children().length > 0) {
                calendar.render();
            }


        });
    });

</script>
<div class="container">


    <div id="calendarModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog mw-100 w-75">
            <div class="modal-content">
                <div class="calendar-container">
                    <div id='calendar'></div>

                </div>
            </div>
        </div>
    </div>
    <div class="Teacher Teacher-desktop">
        <div class="Teacher-main">
            <div class="TeacherInfoCard teacherCard-box1 TeacherInfoCard-desktop">
                <div class="teacherCard">
                    <div class="teacherCard-left">
                        <div class="avatar avatar-big avatar-shadow avatar-placeholder" url="1T054516880">
                            <img src="https://scontent.ffod1-1.fna.fbcdn.net/v/t1.0-1/p320x320/50995047_2200438226885784_5050945694022500352_n.jpg?_nc_cat=102&_nc_oc=AQmHhEC2rfHAG0OiJngc4onjlpbj4C7t6ZCNtvJMKkUFaVyOYML7HfNFSkOuu_lnOTs&_nc_ht=scontent.ffod1-1.fna&oh=9e67138b99402dd33d05ccf8842b24c8&oe=5DEB02BC"
                                 alt="Avatar">
                        </div>
                        <div class="Offline"><span>Offline</span></div>
                        <div class="Offline-diffTime"><span>Visited 48 minutes ago </span></div>
                    </div>
                    <div class="teacherCard-body">
                        <div class="teacherCard-part1">
                            <div class="teacherCard-middle">
                                <div class="teacherCard-name">${teacher.firstName} ${teacher.lastName}
                                    <img class="flag-icon" src="https://d1m3ds7i7t710d.cloudfront.net/orion/static/media/vn.25a5aa32.svg" alt="VN" width="30px" heigh="16px">
                                </div>
                                <div class="teacherCard-personalInfo">
                                    <div><span>Professional Teacher</span></div>
                                    <div><span>From</span> <span>Vietnam</span></div>
                                    <div><span>Living in Ho Chi Minh city</span><span class="teacherCard-time">&nbsp;(<span>15:03</span>&nbsp;<span
                                            class="user-based-timezone">UTC-06:00</span>)</span></div>
                                </div>
                                <div class="redbar"></div>
                            </div>
                            <div class="teacherCard-right">
                                <div class="teacherCard-right-icon"><span class="teacher-send-message"><span
                                        class="teacherCard-right-icon"><img
                                        src="https://d1m3ds7i7t710d.cloudfront.net/orion/static/media/messages.2171fbbe.svg"
                                        alt="messages" width="30" height="30"></span></span><span class="Favourite"><img
                                        src="https://d1m3ds7i7t710d.cloudfront.net/orion/static/media/favourite.96354e1f.svg"
                                        alt="favourite" width="30" height="30"></span></div>
                                <div class="teacherCard-right-body">
                                    <div class="teacherCard-stars">
                                        <div class="stars-box">
                                            <div class="star"></div>
                                            <div class="star"></div>
                                            <div class="star"></div>
                                            <div class="star"></div>
                                            <div class="star"></div>
                                            <span class="number">5.0</span></div>
                                    </div>
                                    <div><span>80 LESSONS</span></div>
                                    <div><span>17 STUDENTS</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="teacherCard-part2">
                            <div>
                                <div class="teacherCard-teaches">
                                    <div class="teacherCard-teaches-title"><span>Teaches</span></div>
                                    <div class="teacherCard-teaches-languages">
                                        <div><span class="language"><span>English</span></span><span
                                                class="tooltip-container-box" gap="5"><span class="tooltip-container"
                                                                                            placement="bottom"><span
                                                class="tooltip-reference"><div><span
                                                class="level level-color-2 level-color-3"></span><span
                                                class="level level-color-2 level-color-3"></span><span
                                                class="level level-color-2 level-color-3"></span><span
                                                class="level level-color-2 level-color-3"></span><span
                                                class="level level-color-2 level-color-3"></span></div></span></span></span>
                                        </div>
                                        <div><span class="language"><span>Spanish</span></span><span
                                                class="tooltip-container-box" gap="5"><span class="tooltip-container"
                                                                                            placement="bottom"><span
                                                class="tooltip-reference"><div><span class="level level-color-2"></span><span
                                                class="level level-color-2"></span><span
                                                class="level level-color-2"></span><span
                                                class="level level-color-2"></span><span
                                                class="level level-color-2"></span></div></span></span></span></div>
                                    </div>
                                </div>
                                <div class="teacherCard-teaches"><span class="teacherCard-teaches-title"><span>Also speaks</span></span>
                                    <div class="teacherCard-teaches-languages">
                                        <div><span class="language"><span>French</span></span><span
                                                class="tooltip-container-box" gap="5"><span class="tooltip-container"
                                                                                            placement="bottom"><span
                                                class="tooltip-reference"><div><span class="level level-color-2"></span><span
                                                class="level level-color-2"></span><span
                                                class="level level-color-2"></span><span
                                                class="level level-color-1"></span><span
                                                class="level level-color-1"></span></div></span></span></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="aboutMe" style="">
                    <div></div>
                    <div><h2 class="cardTitle"><span>About Me</span>
                    </h2>
                        <div class="aboutMe-content"><span> ${teacher.aboutDescription}</span></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="teacher-right-fixed" style="left: 860px;top: 52px;bottom: auto;">
            <div class="teacher-schedule">
                <div class="small-schedule">
                    <div class="small-schedule-days"><p class="small-schedule-day"><span>T</span><br><span>18</span></p>
                        <p class="small-schedule-day"><span>F</span><br><span>19</span></p>
                        <p class="small-schedule-day"><span>S</span><br><span>20</span></p>
                        <p class="small-schedule-day"><span>S</span><br><span>21</span></p>
                        <p class="small-schedule-day"><span>M</span><br><span>22</span></p>
                        <p class="small-schedule-day"><span>T</span><br><span>23</span></p>
                        <p class="small-schedule-day"><span>W</span><br><span>24</span></p></div>
                    <div class="small-schedule-hours">
                        <div class="small-schedule-range"><p>00 - 04</p>
                            <p>04 - 08
                                <fv
                                /p>
                            <p>08 - 12</p>
                            <p>12 - 16</p>
                            <p>16 - 20</p>
                            <p>20 - 24</p></div>
                        <div class="small-schedule-hour">
                            <div class="small-schedule-section">
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"><span class="tooltip-container-box" gap="5"
                                                                       style="width: 100%; height: 100%;"><span
                                        class="tooltip-container" placement="top"><span
                                        class="tooltip-reference small-schedule-cell-tooltip-ref"><div
                                        class="small-schedule-cell-active"></div></span></span></span></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"><span class="tooltip-container-box" gap="5"
                                                                       style="width: 100%; height: 100%;"><span
                                        class="tooltip-container" placement="top"><span
                                        class="tooltip-reference small-schedule-cell-tooltip-ref"><div
                                        class="small-schedule-cell-active"></div></span></span></span></div>
                            </div>
                            <div class="small-schedule-section">
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                            </div>
                            <div class="small-schedule-section">
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"><span class="tooltip-container-box" gap="5"
                                                                       style="width: 100%; height: 100%;"><span
                                        class="tooltip-container" placement="top"><span
                                        class="tooltip-reference small-schedule-cell-tooltip-ref"><div
                                        class="small-schedule-cell-active"></div></span></span></span></div>
                            </div>
                            <div class="small-schedule-section">
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                            </div>
                            <div class="small-schedule-section">
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                            </div>
                            <div class="small-schedule-section">
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                            </div>
                            <div class="small-schedule-section">
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"></div>
                                <div class="small-schedule-cell"><span class="tooltip-container-box" gap="5"
                                                                       style="width: 100%; height: 100%;"><span
                                        class="tooltip-container" placement="top"><span
                                        class="tooltip-reference small-schedule-cell-tooltip-ref"><div
                                        class="small-schedule-cell-active"></div></span></span></span></div>
                            </div>
                        </div>
                    </div>
                    <div class="flex-center">
                        <button type="button" class="small-schedule-button btn btn-big btn-ghost-default"
                                data-toggle="modal" data-target=".bd-example-modal-lg"><span>CHECK AVAILABILITY</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jspf" %>