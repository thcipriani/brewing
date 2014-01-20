---
layout: default
title: Brewing Notes
---

{% for post in site.posts %}
  <article>
    <header>
      <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>
    </header>
    <footer>Posted on: {{ post.date | date: "%B %e, %Y" }} by Tyler Cipriani</footer>
    <p>
      {{ post.excerpt }}
    </p>
  </article>
{% endfor %}