<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé</title>
                <style>
                    table, th, td {
                        border: 1px solid black;
                        border-collapse: collapse;
                    }
                    th, td {
                        padding: 5px;
                        text-align: left;
                    }
                    .fr {
                        float: right;
                    }
                </style>
            </head>
            <body>
                <ul>
                    <li>RIB: <xsl:value-of select="releve/@RIB"/></li>
                    <li>date: <xsl:value-of select="releve/dateReleve"/></li>
                    <li>solde: <xsl:value-of select="releve/solde"/></li>
                </ul>
                <table>
                    <tr>
                        <th>Débit</th>
                        <th>Credit</th>
                        <th>Date</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="if (@type='DEBIT') then concat(@montant, ' MAD') else ''"/> </td>
                            <td><xsl:value-of select="if (@type='CREDIT') then concat(@montant, ' MAD') else ''"/> </td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                    <tfoot>
                        <tr>
                            <td colspan="4">Total Débit: 
                                <span class="fr"><xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/> MAD</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">Total Crédit: 
                                <span class="fr"> <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> MAD</span>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>