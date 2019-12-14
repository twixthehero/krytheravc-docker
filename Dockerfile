FROM mcr.microsoft.com/dotnet/core/sdk:3.0
LABEL author="Maximilian Wright (twixthehero@gmail.com)"
LABEL version="1.0.2"
LABEL source="https://github.com/twixthehero/krytheravc-docker.git"

RUN git clone https://github.com/twixthehero/krytheravc.git
WORKDIR /krytheravc
RUN dotnet publish -c Release -o published

WORKDIR /krytheravc/published
ENV APP_TOKEN="<YOUR TOKEN HERE>"
ADD /scripts/ /opt/scripts/
RUN chmod -R 770 /opt/scripts/

ENTRYPOINT ["/opt/scripts/start.sh"]
