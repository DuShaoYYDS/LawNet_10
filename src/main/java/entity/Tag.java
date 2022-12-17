package entity;

import java.util.ArrayList;
import java.util.List;

/**
* Created by dushao 2022/20/24
* */
public class Tag {

    private Long id;
    private String name;

    private List<Blog> blogs = new ArrayList<>();
    private int count;

    public Tag() {
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }

}
