FROM ruby:3.2.5

# Install basic dependencies
RUN apt-get update -y


COPY Gemfile Gemfile.lock ./
COPY . .

ENV BASED=SVQ

ENTRYPOINT ["ruby"]
CMD ["main.rb"]