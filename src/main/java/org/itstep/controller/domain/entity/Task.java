package org.itstep.controller.domain.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
@ToString(exclude = "category")
@AllArgsConstructor
public class Task {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NonNull
    private String title;
    @NonNull
    private int importance;
    @NonNull
    @Column(columnDefinition = "date", nullable = false)
    private Date deadline;
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Category category;
}
