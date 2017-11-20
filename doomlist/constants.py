URL_REGEX = 'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+'
HASHTAG_REGEX = '#(?:[a-zA-Z]|[0-9]|[-_.+])+'
BANDCAMP_URL_TEMPLATE = 'https://bandcamp.com/EmbeddedPlayer/album={album_id}/size=large/artwork=small'
SLACK_AUTH_URL = 'https://slack.com/api/oauth.access?client_id={client_id}&client_secret={client_secret}&code={code}'