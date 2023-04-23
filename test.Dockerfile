FROM archlinux-yay:latest
ARG TAGS

RUN pacman -Syu --noconfirm
RUN pacman -S base-devel --noconfirm
RUN pacman -S curl git ansible --noconfirm

RUN useradd --uid 2000 --create-home lwi
RUN echo -e "asdf1234\nasdf1234" | passwd lwi
RUN usermod -aG wheel lwi
RUN sed -E -i 's/# %wheel ALL=\(ALL:ALL\) ALL/%wheel ALL=\(ALL:ALL\) ALL/g' /etc/sudoers

WORKDIR /home/lwi

COPY . .

