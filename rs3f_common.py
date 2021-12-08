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
from os.path import join

RS3F_ROOT = "/rs3f_data"

HOME_DIR = join(RS3F_ROOT, "home")
CHROOT_DIR = join(RS3F_ROOT, "chroot")
UIDS_PATH = join(RS3F_ROOT, "uids.json")


def get_home_path(name: str) -> str:
    return join(HOME_DIR, name)


def get_jail_path(name: str) -> str:
    return join(CHROOT_DIR, name)


def get_authorized_keys_path(name: str) -> str:
    return join(HOME_DIR, name, ".ssh", "authorized_keys")
