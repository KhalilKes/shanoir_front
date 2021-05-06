  step "init: keycloak"
        docker-compose run --rm -e SHANOIR_MIGRATION=init keycloak

        step "start: keycloak"
        docker-compose up -d keycloak
        utils/oneshot   '\| *JBoss Bootstrap Environment'                               \
                        ' INFO  \[org.jboss.as\] .* Keycloak .* started in [0-9]*ms'    \
                        -- docker-compose logs --no-color --follow keycloak >/dev/null

step "start: nginx"
        docker-compose up -d nginx
