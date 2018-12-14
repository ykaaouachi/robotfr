FROM python:2.7-alpine3.8

LABEL Maintainer="Youssef K<ykaaouachi@gmail.com>" Version="1.0"

RUN apk add --no-cache \
    # git to clone tests from another repository if needed
    git \
    # for Chrome
    udev \
    chromium \
    chromium-chromedriver \
    # for firefox
    dbus \
    ttf-freefont \
    firefox-esr \
    # ---
    xvfb && \
    pip install --no-cache-dir \
    robotframework==3.0.2 \
    robotframework-selenium2library==1.8.0 \
    selenium==3.3.1
    # for firefox : selenium==2.53.6

# For firefox
#RUN cd /tmp && \
#    wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-arm7hf.tar.gz && \
#    tar -xvzf geckodriver* && \
#    chmod +x geckodriver && \
#    mv geckodriver /usr/local/bin/ && \
#    export PATH=$PATH:/usr/local/bin/geckodriver


# Chrome requires docker to have cap_add: SYS_ADMIN if sandbox is on.
# Disabling sandbox and gpu as default.
RUN sed -i "s/self._arguments\ =\ \[\]/self._arguments\ =\ \['--no-sandbox',\ '--disable-gpu'\]/" /usr/local/lib/python2.7/site-packages/selenium/webdriver/chrome/options.py

COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh

ENV SCREEN_WIDTH 1280
ENV SCREEN_HEIGHT 720
ENV SCREEN_DEPTH 16

ENTRYPOINT [ "/opt/bin/entry_point.sh" ]

