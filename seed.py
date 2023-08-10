# seed.py
from django.core.management.base import BaseCommand
from lab_environment.models import LabTopic, Challenge

class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        topics = ['SQL injection', 'XSS', 'CSRF', 'Access Control']

        for topic_name in topics:
            topic = LabTopic.objects.create(name=topic_name)
            Challenge.objects.create(
                lab_topic=topic,
                title='Example Challenge',
                description='This is an example challenge for the topic.',
                solution='The solution to the challenge goes here.'
            )
