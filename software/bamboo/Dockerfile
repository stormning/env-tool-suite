FROM hub.slyak.com/common-debain-openjdk

# Setup useful environment variables
ENV BAMBOO_HOME     /var/atlassian/bamboo
ENV BAMBOO_INSTALL  /opt/atlassian/bamboo
ENV BAMBOO_WEB      ${BAMBOO_INSTALL}/atlassian-bamboo/WEB-INF
ENV BAMBOO_WEB_LIB  ${BAMBOO_WEB}/lib
ENV BAMBOO_VERSION  6.1.0

# Install Atlassian Bamboo and helper tools and setup initial home
# directory structure.
ADD atlassian-bamboo-${BAMBOO_VERSION}.tar /
RUN mkdir -p /opt/atlassian \
    && mv /atlassian-bamboo-${BAMBOO_VERSION} ${BAMBOO_INSTALL}

#use mysql
COPY mysql-connector-java-5.1.39.jar ${BAMBOO_WEB_LIB}/

#crack
COPY atlassian-extras-decoder-v2-3.3.0.jar ${BAMBOO_WEB_LIB}/
COPY atlassian-extras-legacy-3.3.0.jar ${BAMBOO_WEB_LIB}/

RUN  rm "${BAMBOO_WEB}/atlassian-bundled-plugins/atlassian-universal-plugin-manager-plugin-2.22.1.jar"
COPY atlassian-universal-plugin-manager-plugin-2.22.jar ${BAMBOO_WEB}/atlassian-bundled-plugins/

#sso
ENV X_PROXY_NAME   dev.slyak.com
ENV X_PROXY_PORT   80
ENV X_PATH         /bamboo

RUN set -x \
    && curl --silent https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && apt-get install --quiet --yes --no-install-recommends git-lfs \
    && git lfs install \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p               "${BAMBOO_HOME}/lib" \
    && chmod -R 700           "${BAMBOO_HOME}" \
    && chown -R daemon:daemon "${BAMBOO_HOME}" \
    && mkdir -p               "${BAMBOO_INSTALL}" \
#    && curl -Ls               "https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz" | tar -zx --directory  "${BAMBOO_INSTALL}" --strip-components=1 --no-same-owner \
#    && curl -Ls                "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz" | tar -xz --directory "${BAMBOO_INSTALL}/lib" --strip-components=1 --no-same-owner "mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar" \
    && chmod -R 700           "${BAMBOO_INSTALL}" \
    && chown -R daemon:daemon "${BAMBOO_INSTALL}" \
    && sed --in-place         's/^# umask 0027$/umask 0027/g' "${BAMBOO_INSTALL}/bin/setenv.sh" \
    && xmlstarlet             ed --inplace \
        --delete              "Server/Service/Engine/Host/@xmlValidation" \
        --delete              "Server/Service/Engine/Host/@xmlNamespaceAware" \
                              "${BAMBOO_INSTALL}/conf/server.xml" \
    && touch -d "@0"          "${BAMBOO_INSTALL}/conf/server.xml"


# Use the default unprivileged account. This could be considered bad practice
# on systems where multiple processes end up being executed by 'daemon' but
# here we only ever run one process anyway.
USER daemon:daemon

# Expose default HTTP and SSH ports.
EXPOSE 8085 54663

# Set volume mount points for installation and home directory. Changes to the
# home directory needs to be persisted as well as parts of the installation
# directory due to eg. logs.
VOLUME ["/var/atlassian/bamboo","/opt/atlassian/bamboo/logs"]

# Set the default working directory as the Bamboo home directory.
WORKDIR /var/atlassian/bamboo

COPY "docker-entrypoint.sh" "/"
ENTRYPOINT ["/docker-entrypoint.sh"]

# Run Atlassian Bamboo as a foreground process by default.
CMD ["/opt/atlassian/bamboo/bin/start-bamboo.sh", "-fg"]