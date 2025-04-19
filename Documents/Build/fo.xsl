<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/fo/docbook.xsl"/>
    <xsl:import href="fo-common.xsl"/>
    <xsl:param name="toc.section.depth">1</xsl:param>
    <xsl:param name="draft.mode">no</xsl:param>
    <xsl:param name="funcsynopsis.style">ansi</xsl:param>
    <xsl:param name="toc.max.depth">2</xsl:param>
    <xsl:param name="generate.toc">book      toc,title</xsl:param>
    <xsl:param name="fop1.extensions">1</xsl:param>
    <xsl:param name="page.margin.inner">0.75in</xsl:param>
    <xsl:param name="body.start.indent">0pt</xsl:param>
    <xsl:param name="body.font.family">'IBM Plex Serif'</xsl:param>
    <xsl:param name="page.margin.bottom">0.25in</xsl:param>
    <xsl:param name="page.margin.top">0.25in</xsl:param>
    <xsl:param name="line-height">1.30</xsl:param>
    <xsl:param name="monospace.font.family">'IBM Plex Mono'</xsl:param>
    <xsl:param name="page.margin.outer">0.75in</xsl:param>
    <xsl:param name="title.font.family">'IBM Plex Sans'</xsl:param>
    <xsl:param name="paper.type">A4</xsl:param>
</xsl:stylesheet>
