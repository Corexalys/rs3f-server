# Copyright (C) 2021 Corexalys.
#
# This file is part of rs3f.
#
# rs3f is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# rs3f is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with rs3f.  If not, see <https://www.gnu.org/licenses/>.
FROM debian:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openssh-server python3 gocryptfs

ADD sshd_config /etc/ssh/sshd_config

RUN mkdir -p /run/sshd

RUN groupadd -g 999 sftp_users

ADD entrypoint.sh         /rs3f_bin/
ADD add_container         /rs3f_bin/
ADD add_user              /rs3f_bin/
ADD delete_user           /rs3f_bin/
ADD list_containers       /rs3f_bin/
ADD list_users            /rs3f_bin/
ADD load_initial_accounts /rs3f_bin/
ENV PATH=/rs3f_bin:/usr/bin:/bin:/usr/sbin:/sbin

ADD rs3f_common.py /usr/lib/python3/dist-packages/

HEALTHCHECK CMD ssh-keyscan localhost

CMD entrypoint.sh
