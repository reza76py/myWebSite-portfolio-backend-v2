from django.db import models

class Project(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    github_url = models.URLField(blank=True, null=True)
    demo_url = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.title
