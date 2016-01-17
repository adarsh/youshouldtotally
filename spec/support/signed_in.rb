module Features
  def be_signed_in
    have_text t("layouts.application.sign_out")
  end
end
