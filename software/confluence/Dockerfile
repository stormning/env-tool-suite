FROM slyak/common-openjdk

# Setup useful environment variables
ENV CONF_HOME     /var/atlassian/confluence
ENV CONF_INSTALL  /opt/atlassian/confluence
ENV CONF_WEB      ${CONF_INSTALL}/confluence/WEB-INF
ENV CONF_WEB_LIB  ${CONF_WEB}/lib
ENV CONF_VERSION  6.2.1

ENV JAVA_CACERTS  $JAVA_HOME/jre/lib/security/cacerts
ENV CERTIFICATE   $CONF_HOME/certificate

# Install Atlassian Confluence and hepler tools and setup initial home
# directory structure.
ADD atlassian-confluence-${CONF_VERSION}.tar /
RUN mkdir -p /opt/atlassian \
    && mv /atlassian-confluence-${CONF_VERSION} ${CONF_INSTALL}

#copy fonts
ADD Fonts.zip /
RUN unzip -q Fonts.zip && mv Fonts /usr/share/fonts/truetype/msttcorefonts && rm -f Fonts.zip

#setenv
COPY setenv.sh ${CONF_INSTALL}/bin/

#use mysql
COPY mysql-connector-java-5.1.39.jar ${CONF_WEB_LIB}/

#conf crack
COPY atlassian-extras-decoder-v2-3.2.jar ${CONF_WEB_LIB}/
RUN  rm "${CONF_WEB}/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-2.22.1.jar"
COPY atlassian-universal-plugin-manager-plugin-2.22.jar ${CONF_WEB}/atlassian-bundled-plugins/

#crowd sso
ENV X_PROXY_NAME   dev.slyak.com
ENV X_PROXY_PORT   80
ENV X_PATH         /confluence
ENV CROWD_BASE_URL http://${X_PROXY_NAME}/crowd

COPY crowd/conf/crowd.properties.tmpl  ${CONF_WEB}/classes/
COPY seraph-config.xml ${CONF_WEB}/classes/

RUN mkdir -p                   "${CONF_HOME}" \
    && chmod -R 700            "${CONF_HOME}" \
    && mkdir -p                "${CONF_INSTALL}/conf" \
    && chmod -R 700            "${CONF_INSTALL}/conf" \
    && mkdir -p                "${CONF_INSTALL}/temp" \
    && chmod -R 700            "${CONF_INSTALL}/temp" \
    && mkdir -p                "${CONF_INSTALL}/logs" \
    && chmod -R 700            "${CONF_INSTALL}/logs" \
    && mkdir -p                "${CONF_INSTALL}/work" \
    && chmod -R 700            "${CONF_INSTALL}/work" \
    && echo -e                 "\nconfluence.home=$CONF_HOME" >> "${CONF_INSTALL}/confluence/WEB-INF/classes/confluence-init.properties" \
    && xmlstarlet              ed --inplace \
        --delete               "Server/@debug" \
        --delete               "Server/Service/Connector/@debug" \
        --delete               "Server/Service/Connector/@useURIValidationHack" \
        --delete               "Server/Service/Connector/@minProcessors" \
        --delete               "Server/Service/Connector/@maxProcessors" \
        --delete               "Server/Service/Engine/@debug" \
        --delete               "Server/Service/Engine/Host/@debug" \
        --delete               "Server/Service/Engine/Host/Context/@debug" \
                               "${CONF_INSTALL}/conf/server.xml" \
    && touch -d "@0"           "${CONF_INSTALL}/conf/server.xml" \

# Expose default HTTP connector port.
EXPOSE 8090

# Set volume mount points for installation and home directory. Changes to the
# home directory needs to be persisted as well as parts of the installation
# directory due to eg. logs.
VOLUME ["/var/atlassian/confluence", "/opt/atlassian/confluence/logs"]

# Set the default working directory as the Confluence home directory.
WORKDIR /var/atlassian/confluence

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# Run Atlassian Confluence as a foreground process by default.
CMD ["/opt/atlassian/confluence/bin/catalina.sh", "run"]