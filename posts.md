---
layout: page
title: Posts
permalink: /posts/
---

# 📝 Write-ups & Artigos

<ul>
  {% for post in site.posts %}
    <li>
      <span>{{ post.date | date: "%d/%m/%Y" }}</span> — 
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% else %}
    <p>Em breve o primeiro write-up sobre o Lab OpenWrt!</p>
  {% endfor %}
</ul>