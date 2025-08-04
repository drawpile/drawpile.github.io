---
layout: drawpile_help
title:  "Alpha-Erhalt, Clipping-Gruppen, Masken, Alpha-Sperre"
description: "Wie Alpha, Clipping, Masken etc. in Drawpile funktionieren."
date: 2023-11-19 00:00:00 +0100
category: "help"
tag: help draw lang_de
---

*This article is available in the following languages:* [*English*](clipping), German.

<div class="notification">
    <strong>Hinweis:</strong> Drawpile 2.3 (aktuell in beta) fügt <a href="/help/common/update2x3x0#layer-clipping-23-only">durch Ebene darunter beschneiden</a> und <a href="/help/common/update2x3x0#explicit-inheritpreserve-alpha-23-only">Alpha erben</a> als Optionen für den Alpha-Erhalt hinzu. Die folgenden Informationen sind für Drawpile 2.2.
</div>

Drawpile unterstützt Alpha-Erhalt ("alpha preserve") auf Ebenen. Dies ist auch unter verschiedenen anderen Namen bekannt, zum Beispiel "Clipping-Gruppen" ("clipping groups") oder "Alpha-Vererbung" ("inherit alpha"). Es bedeutet, dass eine Ebene keine neuen Pixel zur Leinwand hinzufügt, sondern nur jene unter ihr verändert. Es wird oft für Schattierung und Belichtung verwendet.

In Drawpile erhalten alle Mischmodi außer Normal und Radieren den Alphakanal. Das bedeutet, dass Sie nichts besonderes tun müssen, um es zu aktivieren, stecken Sie einfach Ihre Ebenen in eine Gruppe. Also, wenn sie zum Beispiel ein Bild schattieren wollen, ordnen Sie ihre Ebenen wie folgt an:

* 📁 **Gruppe** (Normal)
  * 📄 **Linien** (Normal)
  * 📄 **Licht** (Negativ Multiplizieren / "Screen")
  * 📄 **Schatten** (Multiplizieren / "Multiply")
  * 📄 **Farben** (Normal)

Die Ebenen **Licht** und **Schatten** erhalten den Alphakanal der Ebene **Farben**, sodass Sie Licht und Schatten malen können, ohne sich sorgen über ein Übertreten zu machen.

Die Gruppe ist *notwendig*! Ohne sie mischen sich Ihre ebenen mit dem Leinwandhintergrund, was bedeutet, dass sie keine sinnvolle Erhaltung des Alphakanals erhalten.

Wenn Sie eine Alpha-erhaltende Ebene mit Modus Normal haben möchten, verwenden Sie den Mischmodus Umfärben ("Recolor").

Wenn Sie *nicht* wollen, dass die Inhalte einer Gruppe den Alphakanal erhalten, setzen Sie den Mischmodus der Gruppe auf Durchreichen ("Pass-Through").

## Masken

Die obigen Arten von Anordnungen sollten für die meisten Fälle genügen. Wenn Sie dennoch *wirklich* eine Maske benötigen, können Sie eine Ebene mit Modus Radieren ("Erase") in einer Anordnung wie folgt verwenden:

* 📁 **Gruppe** (Normal)
  * 📄 **Maske** (Radieren / "Erase")
  * 📄 **Übrige Sachen** (Normal)

Wenn Sie nun auf die Ebene **Maske** malen, wird sie diese Teile der darunterliegenden Ebenen maskieren, was den gleichen Effekt wie eine Transparenzmaske hat.

## Alpha-Sperre

<div class="notification">
    <strong>Hinweis:</strong> Drawpile 2.3 (aktuell in beta) fügt <a href="/help/common/update2x3x0#layer-alpha-lock-22-compatible">Alpha-Sperre für Ebenen</a> als Option für Alpha-Sperren hinzu. Die folgenden Informationen sind für Drawpile 2.2.
</div>

Einige Programme erlauben das aktivieren einer "Alpha-Sperre" ("alpha lock") auf einer Ebene, wodurch das Malen darauf die Transparenz existierender Pixel nicht beeinflusst. In Drawpile ist dies eine Eigenschaft des Pinsels, nicht eine der Ebene.

Mit klassischen Pinseln, ändern Sie den Mischmodus zu "Umfärben" ("Recolor"). Mit MyPaint-Pinseln, aktivieren Sie den Knopf mit dem Schlüsselsymbol.

Das Tastaturkürzel hierfür heißt "Umfärbungsmodus umschalten" ("Toggle Recolor Mode"), standardmäßig ist dies <kbd>Shift+E</kbd>.

![Umfärbungsmodus bei Pinseln]({{ "/assets/img/help/recolor.webp" | relative_url }})

## Alternative Alpha-Sperre

Falls der Umfärbungsmodus des Pinsels nicht genug ist können Sie die Ebene in eine Gruppe stecken und eine weitere Ebene mit dem Mischmodus Umfärben ("Recolor") darüber setzen:

* 📁 **Gruppe** (Normal)
  * 📄 **Änderungen** (Umfärben / "Recolor")
  * 📄 **Basis** (Normal)

Nun können Sie auf der Ebene **Änderungen** malen und sie wird den Alphakanal der Ebene **Basis** erhalten, was den gleichen Effekt wie eine Alpha-Sperre hat.
