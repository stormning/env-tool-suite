FROM openjdk:8
ENV  FISHEYE_HOME /var/atlassian/fisheye
ENV  FISHEYE_INST /opt/atlassian/fisheye
ENV  FISHEYE_VERSION 4.4.2

ENV LANG C.UTF-8

# TODO The Universal Plugin Manager (v2.21.5)

ADD fecru-$FISHEYE_VERSION.zip /
RUN mkdir -p /opt/atlassian \
    && unzip -q fecru-$FISHEYE_VERSION.zip && mv fecru-$FISHEYE_VERSION ${FISHEYE_INST}

#crack
COPY atlassian-extras-2.5.jar ${FISHEYE_INST}/lib/

# /opt/atlassian/fisheye/config.xml
RUN mkdir -p /var/atlassian/fisheye \
    && chmod -R 700            "${FISHEYE_HOME}" \
    && chmod -R 700            "${FISHEYE_INST}" \
    && chown -R daemon:daemon  "${FISHEYE_HOME}" \
    && chown -R daemon:daemon  "${FISHEYE_INST}"

EXPOSE 8060

USER daemon:daemon
WORKDIR $FISHEYE_INST
VOLUME ["${FISHEYE_INST}/var","${FISHEYE_HOME}"]
ENTRYPOINT ["/opt/atlassian/fisheye/bin/fisheyectl.sh","run"]