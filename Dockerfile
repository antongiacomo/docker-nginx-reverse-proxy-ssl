FROM nginx:1.7
MAINTAINER Kyle Mathews "mathews.kyle@gmail.com"


RUN mkdir -p /etc/nginx/ssl/jenkins.moon-cloud.eu
RUN mkdir -p /etc/nginx/ssl/jira.moon-cloud.eu


# Copy in conf files
COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
COPY ssl.conf /etc/nginx/
COPY site.conf /etc/nginx/sites-enabled/

# COPY in certs
COPY jira.crt /etc/nginx/ssl/jira.moon-cloud.eu
COPY jira.key /etc/nginx/ssl/jira.moon-cloud.eu

COPY jenkins.crt /etc/nginx/ssl/jenkins.moon-cloud.eu
COPY jenkins.key /etc/nginx/ssl/jenkins.moon-cloud.eu

# Expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

CMD ["nginx"]

