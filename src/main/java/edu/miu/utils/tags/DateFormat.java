package edu.miu.utils.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateFormat extends SimpleTagSupport {
    private LocalDateTime date = LocalDateTime.now();

    @Override
    public void doTag() throws JspException, IOException {
        String dateString = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));

        getJspContext().getOut().write(dateString);
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
}

