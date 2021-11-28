FROM debian:11

RUN apt update && apt install -y libcgi-pm-perl libmojolicious-perl

WORKDIR /usr/local/bin

COPY calc.pl .
RUN chmod 755 calc.pl

EXPOSE 8080
CMD ["/usr/bin/hypnotoad", "--foreground", "/usr/local/bin/calc.pl"]
