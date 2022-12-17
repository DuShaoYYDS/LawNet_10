package entity;

import java.util.ArrayList;
import java.util.List;

public class AllList {
    private List<Blog> blogs = new ArrayList<>();
    private List<Tag> tags = new ArrayList<>();
    private List<Type> types = new ArrayList<>();

    public AllList(List<Blog> blogs, List<Tag> tags, List<Type> types) {
        this.blogs = blogs;
        this.tags = tags;
        this.types = types;
    }

    public AllList() {
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public List<Type> getTypes() {
        return types;
    }

    public void setTypes(List<Type> types) {
        this.types = types;
    }
}
