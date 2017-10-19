FROM hub.slyak.com/common
# Configuration variables.
ENV JIRA_HOME     /var/atlassian/jira
ENV JIRA_INSTALL  /opt/atlassian/jira
ENV JIRA_WEB      ${JIRA_INSTALL}/atlassian-jira/WEB-INF
ENV JIRA_WEB_LIB  ${JIRA_WEB}/lib
ENV JIRA_VERSION  7.3.6

ENV X_PROXY_NAME   dev.slyak.com
ENV X_PROXY_PORT   80
ENV X_PATH         /jira
ENV CROWD_BASE_URL http://${X_PROXY_NAME}/crowd

# Install Atlassian JIRA and helper tools and setup initial home
# directory structure.

ADD atlassian-jira-software-${JIRA_VERSION}.tar /
RUN mkdir -p /opt/atlassian \
    && mv /atlassian-jira-software-${JIRA_VERSION}-standalone ${JIRA_INSTALL}

#use mysql
COPY mysql-connector-java-5.1.39.jar ${JIRA_WEB_LIB}/

#jira crack
COPY atlassian-extras-3.2.jar ${JIRA_WEB_LIB}/

#crowd sso
COPY crowd/conf/crowd.properties.tmpl  ${JIRA_WEB}/classes/
COPY crowd/conf/crowd-ehcache.xml ${JIRA_WEB}/classes/
COPY seraph-config.xml ${JIRA_WEB}/classes/

RUN  rm "${JIRA_WEB}/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-2.21.jar"
COPY atlassian-universal-plugin-manager-plugin-2.22.jar ${JIRA_WEB}/atlassian-bundled-plugins/

RUN mkdir -p                   "${JIRA_HOME}" \
    && mkdir -p                "${JIRA_HOME}/caches/indexes" \
    && chmod -R 700            "${JIRA_HOME}" \
    && mkdir -p                "${JIRA_INSTALL}/conf/Catalina" \
    && chmod 700               "${JIRA_INSTALL}/bin/check-java.sh" \
    && sed --in-place          "s/java version/openjdk version/g" "${JIRA_INSTALL}/bin/check-java.sh" \
    && echo -e                 "\njira.home=$JIRA_HOME" >> "${JIRA_INSTALL}/atlassian-jira/WEB-INF/classes/jira-application.properties" \
    && touch -d "@0"           "${JIRA_INSTALL}/conf/server.xml"

# Expose default HTTP connector port.
EXPOSE 8080

# Set volume mount points for installation and home directory. Changes to the
# home directory needs to be persisted as well as parts of the installation
# directory due to eg. logs.
VOLUME ["${JIRA_HOME}", "${JIRA_INSTALL}/logs"]

# Set the default working directory as the installation directory.
WORKDIR ${JIRA_INSTALL}

COPY "docker-entrypoint.sh" "/"
ENTRYPOINT ["/docker-entrypoint.sh"]

# Run Atlassian JIRA as a foreground process by default.
CMD ["/opt/atlassian/jira/bin/catalina.sh", "run"]