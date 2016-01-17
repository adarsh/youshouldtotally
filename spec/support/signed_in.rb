module Features
  def be_signed_in
    have_text t("application.header.sign_out")
  end
end
