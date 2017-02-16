<%@ page import="com.fimelab.reman.pojo.ToolArchiveFile" %>
<%@ page import="com.fimelab.reman.controller.HomePageController" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.fimelab.reman.controller.RegisterPageController" %>
<%@ page import="javax.ws.rs.core.Response" %>
<%@ page import="java.net.URI" %>
<jsp:include page="html/header.jsp" />
<jsp:include page="html/navbar_registered.jsp" />

<%
    if (!RegisterPageController.sessions.get(session)) {
        //Response.temporaryRedirect(new URI("/index.jsp")).build();
    }
%>

<div class="container">
    <!-- Section -->
    <section id="intro" class="intro-section">
        <div class="container">
            <h1>Active tools</h1>
            <div class="row">
                <div class="col-md-11 col-md-offset-1">
                    <table class="table table-striped table-condensed">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Version</th>
                            <th>Status</th>
                            <th>Qualified</th>
                            <th>Publication date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
<%!
    private HomePageController hpc = new HomePageController();
    private Set<ToolArchiveFile> tools;
%>
<%
    tools = hpc.listActiveArchiveFileFromDatabase();

    for (ToolArchiveFile taf : tools) {
        out.println("                        <tr>");
        out.println("                            <td>" + taf.getToolName() + "</td>");
        out.println("                            <td>" + taf.getToolVersion() + "</td>");
        out.println("                            <td>" + taf.getToolStatus() + "</td>");
        out.println("                            <td>");
        out.println("                                <input title=\"qualified\" type=\"checkbox\"" + (taf.isQualified() ? " checked=\"checked\" " : " ") + "disabled=\"disabled\"/>");
        out.println("                            </td>");
        out.println("                            <td>" + taf.getPublicationDate() + "</td>");
        out.println("                            <td>");
        out.println("                                <form method=\"post\" action=\"Reman/home/download\">");
        out.println("                                    <button name=\"filename\" value=\"" + taf.getToolPath() + "\" class=\"btn btn-success\" type=\"submit\">Download</button>");
        out.println("                                </form>");
        out.println("                            </td>");
        out.println("                        </tr>");
    }
%>
                        </tbody>
                    </table>
                </div>
            </div>
            <h1>Archived tools</h1>
            <div class="row">
                <div class="col-md-11 col-md-offset-1">
                    <table class="table table-striped table-condensed">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Version</th>
                            <th>Status</th>
                            <th>Qualified</th>
                            <th>Publication date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
<%
    tools = hpc.listArchivedArchiveFileFromDatabase();

    for (ToolArchiveFile taf : tools) {
        out.println("                        <tr>");
        out.println("                            <td>" + taf.getToolName() + "</td>");
        out.println("                            <td>" + taf.getToolVersion() + "</td>");
        out.println("                            <td>" + taf.getToolStatus() + "</td>");
        out.println("                            <td>");
        out.println("                                <input title=\"qualified\" type=\"checkbox\"" + (taf.isQualified() ? " checked=\"checked\" " : " ") + "disabled=\"disabled\"/>");
        out.println("                            </td>");
        out.println("                            <td>" + taf.getPublicationDate() + "</td>");
        out.println("                            <td>");
        out.println("                                <form method=\"post\" action=\"Reman/home/download\">");
        out.println("                                    <button name=\"filename\" value=\"" + taf.getToolPath() + "\" class=\"btn btn-success\" type=\"submit\">Download</button>");
        out.println("                                </form>");
        out.println("                            </td>");
        out.println("                        </tr>");
    }
%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>

<jsp:include page="html/footer.jsp" />