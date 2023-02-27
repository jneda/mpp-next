import { useState } from "react";
import { useRouter } from "next/router";
import { Formik, Field, Form, ErrorMessage } from "formik";
import * as Yup from 'yup';
import styles from "./LogForm.module.css";

export default function SignForm() {
  const router = useRouter();

  const [user, setUser] = useState({
    email: "",
    password: "",
  });

  const handleChange = (e) => {
    setUser({ ...user, [e.target.name]: e.target.value }); //spread user pour ne pas perdre autres données lors de update
  };

  const handleSubmit = async (userInput) => {
    // e.preventDefault();
    console.log("[login]:", JSON.stringify(userInput));

    let response;
    try {
      response = await fetch("/api/login", {
        method: "POST",
        body: JSON.stringify(userInput),
      });
      setUser({ email: "", password: "" }); //equivalent de input.value="" après enregistrer formulaire

      if (response) {
        // logging
        const data = await response.json();
        console.log(data);
        // redirect
        router.push("/homepage");
      }
    } catch (e) {
      console.error(e);
    }
  };

  return (
    <Formik
      initialValues={{ email: "", password: "" }}
      validationSchema={Yup.object({
        email: Yup.string().email("Adresse email invalide").required("Champ obligatoire"),
        password: Yup.string().required("Champ obligatoire")
      })}
      onSubmit={handleSubmit}
    >
      {formik => (
        <Form className={styles.form}>
          <Field
            type="email"
            name="email"
            placeholder="Email"
          />
          <ErrorMessage name="email">{msg => <div className={styles.errorText}>{msg}</div>}</ErrorMessage>
          <Field
            type="password"
            name="password"
            placeholder="Mot de Passe"
          />
          <ErrorMessage name="password">{msg => <div className={styles.errorText}>{msg}</div>}</ErrorMessage>
          <div className={styles.buttonWrapper}>
            <button className={styles.btn} type="submit">
              Se connecter
            </button>
          </div>
        </Form>
      )}
    </Formik>
  );
}
