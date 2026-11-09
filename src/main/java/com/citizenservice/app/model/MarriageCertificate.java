
  package com.citizenservice.app.model;
  
  import java.io.Serializable;
  
  import jakarta.persistence.Column; import jakarta.persistence.Entity; import
  jakarta.persistence.GeneratedValue; import jakarta.persistence.GenerationType;
  import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
  
  
/*public class MarriageCertificate {

}
*/
  @Entity
  
  @Table(name="marriage_certificate") 
  public class MarriageCertificate implements Serializable {
  
  /**
	 * 
	 */
	private static final long serialVersionUID = 266632118488347608L;

@Id
  
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  
  @Column(name="application_id") private long marriageCertificateApplicationId;
  
  @ManyToOne
  @JoinColumn(name="user") 
  private User userId;
  
  
  @Column(name="groom_name") private String groomName;
  
  @Column(name="groom_id_proof") private String groomIdProof;
  
  @Column(name="groom_photo") private String groomPhoto;
  
  @Column(name="groom_father") private String groomFather;
  
  @Column(name="groom_mother") private String groomMother;
  
  @Column(name="groom_dob") private String groomDob;
  
  @Column(name="groom_religion") private String groomReligion;
  
  @Column(name="groom_mobile") private String groomMobile;
  
  @Column(name="groom_email") private String groomEmail;
  
  @Column(name="groom_address") private String groomAddress;
  
  @Column(name="groom_dist") private String groomDist;
  
  @Column(name="groom_state") private String groomState;
  
  @Column(name="groom_country") private String groomCountry;
  
  @Column(name="groom_pin") private String groomPin;
  
  @Column(name="groom_witness_name") private String groomWitnessName;
  
  @Column(name="groom_witness_id") private String groomWitnessId;
  
  @Column(name="groom_witness_mobile") private String groomWitnessMobile;
  
  @Column(name="groom_witness_relation") private String groomWitnessRelation;
  
  @Column(name="groom_witness_address") private String groomWitnessAddress;
  
  @Column(name="bride_name") private String brideName;
  
  @Column(name="bride_id_proof") private String brideIdProof;
  
  @Column(name="bride_photo") private String bridePhoto;
  
  @Column(name="bride_father") private String brideFather;
  
  @Column(name="bride_mother") private String brideMother;
  
  @Column(name="bride_dob") private String brideDob;
  
  @Column(name="bride_religion") private String brideReligion;
  
  @Column(name="bride_mobile") private String brideMobile;
  
  @Column(name="bride_email") private String brideEmail;
  
  @Column(name="bride_address") private String brideAddress;
  
  @Column(name="bride_dist") private String brideDist;
  
  @Column(name="bride_state") private String brideState;
  
  @Column(name="bride_country") private String brideCountry;
  
  @Column(name="bride_pin") private String bridePin;
  
  @Column(name="bride_witness_name") private String brideWitnessName;
  
  @Column(name="bride_witness_id") private String brideWitnessId;
  
  @Column(name="bride_witness_mobile") private String brideWitnessMobile;
  
  @Column(name="bride_witness_relation") private String brideWitnessRelation;
  
  @Column(name="bride_witness_address") private String brideWitnessAddress;
  
  @Column(name="marriage_date") private String marriageDate;
  
  @Column(name="marriage_type") private String marriageType;
  
  @Column(name="marriage_proof") private String marriageProof;
  
  @Column(name="groom_sign") private String groomSign;
  
  @Column(name="bride_sign") private String brideSign;
  
  @Column(name="groom_witness_sign") private String groomWitnessSign;
  
  @Column(name="bride_witness_sign") private String brideWitnessSign;
  
  @Column
  (name="status") 
  private String status;
  
  
  
  public long getMarriageCertificateApplicationId() { return
  marriageCertificateApplicationId; }
  
  public void setMarriageCertificateApplicationId(long
  marriageCertificateApplicationId) { this.marriageCertificateApplicationId =
  marriageCertificateApplicationId; }
  
  public String getGroomName() { return groomName; }
  
  public void setGroomName(String groomName) { this.groomName = groomName; }
  
  public String getGroomIdProof() { return groomIdProof; }
  
  public void setGroomIdProof(String groomIdProof) { this.groomIdProof =
  groomIdProof; }
  
  public String getGroomPhoto() { return groomPhoto; }
  
  public void setGroomPhoto(String groomPhoto) { this.groomPhoto = groomPhoto;
  }
  
  public String getGroomFather() { return groomFather; }
  
  public void setGroomFather(String groomFather) { this.groomFather =
  groomFather; }
  
  public String getGroomMother() { return groomMother; }
  
  public void setGroomMother(String groomMother) { this.groomMother =
  groomMother; }
  
  public String getGroomDob() { return groomDob; }
  
  public void setGroomDob(String groomDob) { this.groomDob = groomDob; }
  
  public String getGroomReligion() { return groomReligion; }
  
  public void setGroomReligion(String groomReligion) { this.groomReligion =
  groomReligion; }
  
  public String getGroomMobile() { return groomMobile; }
  
  public void setGroomMobile(String groomMobile) { this.groomMobile =
  groomMobile; }
  
  public String getGroomEmail() { return groomEmail; }
  
  public void setGroomEmail(String groomEmail) { this.groomEmail = groomEmail;
  }
  
  public String getGroomAddress() { return groomAddress; }
  
  public void setGroomAddress(String groomAddress) { this.groomAddress =
  groomAddress; }
  
  public String getGroomDist() { return groomDist; }
  
  public void setGroomDist(String groomDist) { this.groomDist = groomDist; }
  
  public String getGroomState() { return groomState; }
  
  public void setGroomState(String groomState) { this.groomState = groomState;
  }
  
  public String getGroomCountry() { return groomCountry; }
  
  public void setGroomCountry(String groomCountry) { this.groomCountry =
  groomCountry; }
  
  public String getGroomPin() { return groomPin; }
  
  public void setGroomPin(String groomPin) { this.groomPin = groomPin; }
  
  public String getGroomWitnessName() { return groomWitnessName; }
  
  public void setGroomWitnessName(String groomWitnessName) {
  this.groomWitnessName = groomWitnessName; }
  
  public String getGroomWitnessId() { return groomWitnessId; }
  
  public void setGroomWitnessId(String groomWitnessId) { this.groomWitnessId =
  groomWitnessId; }
  
  public String getGroomWitnessMobile() { return groomWitnessMobile; }
  
  public void setGroomWitnessMobile(String groomWitnessMobile) {
  this.groomWitnessMobile = groomWitnessMobile; }
  
  public String getGroomWitnessRelation() { return groomWitnessRelation; }
  
  public void setGroomWitnessRelation(String groomWitnessRelation) {
  this.groomWitnessRelation = groomWitnessRelation; }
  
  public String getGroomWitnessAddress() { return groomWitnessAddress; }
  
  public void setGroomWitnessAddress(String groomWitnessAddress) {
  this.groomWitnessAddress = groomWitnessAddress; }
  
  public String getBrideName() { return brideName; }
  
  public void setBrideName(String brideName) { this.brideName = brideName; }
  
  public String getBrideIdProof() { return brideIdProof; }
  
  public void setBrideIdProof(String brideIdProof) { this.brideIdProof =
  brideIdProof; }
  
  public String getBridePhoto() { return bridePhoto; }
  
  public void setBridePhoto(String bridePhoto) { this.bridePhoto = bridePhoto;
  }
  
  public String getBrideFather() { return brideFather; }
  
  public void setBrideFather(String brideFather) { this.brideFather =
  brideFather; }
  
  public String getBrideMother() { return brideMother; }
  
  public void setBrideMother(String brideMother) { this.brideMother =
  brideMother; }
  
  public String getBrideDob() { return brideDob; }
  
  public void setBrideDob(String brideDob) { this.brideDob = brideDob; }
  
  public String getBrideReligion() { return brideReligion; }
  
  public void setBrideReligion(String brideReligion) { this.brideReligion =
  brideReligion; }
  
  public String getBrideMobile() { return brideMobile; }
  
  public void setBrideMobile(String brideMobile) { this.brideMobile =
  brideMobile; }
  
  public String getBrideEmail() { return brideEmail; }
  
  public void setBrideEmail(String brideEmail) { this.brideEmail = brideEmail;
  }
  
  public String getBrideAddress() { return brideAddress; }
  
  public void setBrideAddress(String brideAddress) { this.brideAddress =
  brideAddress; }
  
  public String getBrideDist() { return brideDist; }
  
  public void setBrideDist(String brideDist) { this.brideDist = brideDist; }
  
  public String getBrideState() { return brideState; }
  
  public void setBrideState(String brideState) { this.brideState = brideState;
  }
  
  public String getBrideCountry() { return brideCountry; }
  
  public void setBrideCountry(String brideCountry) { this.brideCountry =
  brideCountry; }
  
  public String getBridePin() { return bridePin; }
  
  public void setBridePin(String bridePin) { this.bridePin = bridePin; }
  
  public String getBrideWitnessName() { return brideWitnessName; }
  
  public void setBrideWitnessName(String brideWitnessName) {
  this.brideWitnessName = brideWitnessName; }
  
  public String getBrideWitnessId() { return brideWitnessId; }
  
  public void setBrideWitnessId(String brideWitnessId) { this.brideWitnessId =
  brideWitnessId; }
  
  public String getBrideWitnessMobile() { return brideWitnessMobile; }
  
  public void setBrideWitnessMobile(String brideWitnessMobile) {
  this.brideWitnessMobile = brideWitnessMobile; }
  
  public String getBrideWitnessRelation() { return brideWitnessRelation; }
  
  public void setBrideWitnessRelation(String brideWitnessRelation) {
  this.brideWitnessRelation = brideWitnessRelation; }
  
  public String getBrideWitnessAddress() { return brideWitnessAddress; }
  
  public void setBrideWitnessAddress(String brideWitnessAddress) {
  this.brideWitnessAddress = brideWitnessAddress; }
  
  public String getMarriageDate() { return marriageDate; }
  
  public void setMarriageDate(String marriageDate) { this.marriageDate =
  marriageDate; }
  
  public String getMarriageType() { return marriageType; }
  
  public void setMarriageType(String marriageType) { this.marriageType =
  marriageType; }
  
  public String getMarriageProof() { return marriageProof; }
  
  public void setMarriageProof(String marriageProof) { this.marriageProof =
  marriageProof; }
  
  public String getGroomSign() { return groomSign; }
  
  public void setGroomSign(String groomSign) { this.groomSign = groomSign; }
  
  public String getBrideSign() { return brideSign; }
  
  public void setBrideSign(String brideSign) { this.brideSign = brideSign; }
  
  public String getGroomWitnessSign() { return groomWitnessSign; }
  
  public void setGroomWitnessSign(String groomWitnessSign) {
  this.groomWitnessSign = groomWitnessSign; }
  
  public String getBrideWitnessSign() { return brideWitnessSign; }
  
  public void setBrideWitnessSign(String brideWitnessSign) {
  this.brideWitnessSign = brideWitnessSign; }

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public User getUserId() {
	return userId;
}

public void setUserId(User userId) {
	this.userId = userId;
}



  
  
  
  
  
  
  
  }
 