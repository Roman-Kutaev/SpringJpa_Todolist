package org.itstep.controller.domain.dto;

import lombok.*;
import org.itstep.controller.domain.entity.Category;
import org.itstep.controller.domain.entity.Task;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class TaskDto {
    private int id;
    @NonNull
    private String title;
    @NonNull
    private int importance;
    @NonNull
    private String deadline;
    @NonNull
    private Category category;

    private final static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public Task toEntity() throws ParseException {
        return new Task(id,title,importance,dateFormat.parse(deadline), category);
    }
}
