package edu.miu.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@Entity
public class Customer {
	@Override
	public String toString() {
		return "Customer [id=" + id + ", passportId=" + passportId + ", firstName=" + firstName + ", lastName="
				+ lastName + ", phoneNumber=" + phoneNumber + ", email=" + email + ", birthday=" + birthday
				+ ", bonusScore=" + bonusScore + "]";
	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotEmpty
    @Column(nullable = false, unique = true)
    private String passportId;

    @NotEmpty
    @Column(nullable = false)
    private String firstName;

    @NotEmpty
    @Column(nullable = false)
    private String lastName;

    @NotEmpty
    @Column(nullable = false)
    private String phoneNumber;

    private String email;

	@Column(nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birthday;

    private Integer bonusScore;
	
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPassportId() {
		return passportId;
	}

	public void setPassportId(String passportId) {
		this.passportId = passportId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public Integer getBonusScore() {
		return bonusScore;
	}

	public void setBonusScore(Integer bonusScore) {
		this.bonusScore = bonusScore;
	}
}
