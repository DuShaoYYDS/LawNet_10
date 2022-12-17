package entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
* Created by dushao on 2022/10/24.
* */

public class Blog {

    private Long id;
    private String title;
    private String content;
    private String firstPicture;
    private String flag;
    private Integer views;
    //赞赏开关
    private boolean appreciation;
    //转载声明
    private boolean shareStatment;
    //评论开关
    private boolean commentabled;
    //是否公开展示
    private boolean published;
    //是否推荐
    private boolean recommend;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date updateTime;
    private String publisherName;
    private Type type;
    private Long typeId;
    private List<Tag> tags = new ArrayList<>();

    private List<Comment> comments = new ArrayList<>();


    private User user;

    public Blog() {
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeID(Long typeId) {
        this.typeId = typeId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFirstPicture() {
        return firstPicture;
    }

    public void setFirstPicture(String firstPicture) {
        this.firstPicture = firstPicture;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public boolean isAppreciation() {
        return appreciation;
    }

    public void setAppreciation(boolean appreciation) {
        this.appreciation = appreciation;
    }

    public boolean isShareStatment() {
        return shareStatment;
    }

    public void setShareStatment(boolean shareStatment) {
        this.shareStatment = shareStatment;
    }

    public boolean isCommentabled() {
        return commentabled;
    }

    public void setCommentabled(boolean commentabled) {
        this.commentabled = commentabled;
    }

    public boolean isPublished() {
        return published;
    }

    public void setPublished(boolean published) {
        this.published = published;
    }

    public boolean isRecommend() {
        return recommend;
    }

    public void setRecommend(boolean recommend) {
        this.recommend = recommend;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }


}
