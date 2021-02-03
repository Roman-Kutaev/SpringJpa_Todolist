package org.itstep.controller.domain.entity;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
public class Category {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NonNull
    private String name;
    @OneToMany(cascade = {CascadeType.REMOVE, CascadeType.MERGE}, mappedBy = "category", fetch = FetchType.EAGER)
    private List<Task> list = new ArrayList<>();

}
