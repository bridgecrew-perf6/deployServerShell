# CentOSBash
CentOS Bash files for deploy server

## List
* kill_springboot.sh ${SERVER_PORT} : 스프링 부트 종료 후 30초 대기 / 실패시 대기 없음
* start_springboot.sh ${SERVER_PORT} ${SPRING_PROFILE} ${BOOT_JAR_PATH} : 스프링 부트 실행 / 성공여부 검사 없음(언제 실행이 완료될지 모름)
