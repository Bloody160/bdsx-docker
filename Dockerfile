FROM amd64/ubuntu:22.04

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y \
                git \
                dos2unix \
                curl \
                libfreetype6 \
                libfreetype-dev \
                libunwind8
RUN curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN apt-get install nodejs -y

# Stage 2
WORKDIR /root/bdsx
RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/karikera/bdsx.git

# Stage 3
ENV node_env=production
ENV WINEARCH=win64
ENV WINEDLLOVERRIDES="VCRUNTIME140_1=n,=b" 
ENV WINEDEBUG=fixme-all 

# Stage 4
COPY --chmod=0755 ./entrypoint.sh /root/entrypoint.sh
COPY --chmod=0755 ./bdsx.sh /root/bdsx.sh
COPY --chmod=0755 wine_bdsx.deb /root/wine_bdsx.deb

# Stage 5
WORKDIR /root
RUN dos2unix entrypoint.sh
RUN dos2unix bdsx.sh
RUN dpkg -i wine_bdsx.deb
RUN rm -f wine_bdsx.deb

# Stage 6
EXPOSE 19132

ENTRYPOINT /bin/sh -c "sh /root/entrypoint.sh"