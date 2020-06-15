package edu.miu.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlTransient;
import java.time.LocalDateTime;

@Entity
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotEmpty
    @Column(length = 20)
    private String factory;

    @NotEmpty
    @Column(length = 20)
    private String model;

    @NotEmpty
    @Column(length = 20)
    private String status = "available";

    @NotEmpty
    @Column(length = 20)
    private String number;

    @NotEmpty
    @Column(length = 20)
    private String type;

    @NotNull
    private Double pricePerDay;

    @NotNull
    @Range(min = 1, max = 100)
    private Integer seats;

    @NotNull
    private Double overduePerDay;

    private LocalDateTime createdDate;

    private LocalDateTime updatedDate;

    @JsonIgnore
    @Transient
    private MultipartFile image;

    private String imagePath;

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @XmlTransient
    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(LocalDateTime updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(Double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public Integer getSeats() {
        return seats;
    }

    public void setSeats(Integer seats) {
        this.seats = seats;
    }

    public Double getOverduePerDay() {
        return overduePerDay;
    }

    public void setOverduePerDay(Double overduePerDay) {
        this.overduePerDay = overduePerDay;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", factory='" + factory + '\'' +
                ", model='" + model + '\'' +
                ", status='" + status + '\'' +
                ", number='" + number + '\'' +
                ", type='" + type + '\'' +
                ", pricePerDay=" + pricePerDay +
                ", seats=" + seats +
                ", overduePerDay=" + overduePerDay +
                ", createdDate=" + createdDate +
                ", updatedDate=" + updatedDate +
                ", image=" + image +
                ", imagePath='" + imagePath + '\'' +
                '}';
    }
}
