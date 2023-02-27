import { useRouter } from "next/router";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";
import styles from "./SignForm.module.css";

export default function SignForm() {
  const router = useRouter();

  const handleSubmit = async (userInput) => {
    

    let response;
    try {
      response = await fetch('/api/createUser', { method: "POST", body: JSON.stringify(userInput) });
    } catch (err) {
      console.error(err);
    }

    console.log("[SignForm component]", response);

    if (!response.ok) {
      // handle error
      return;
    }

    // log in
    try {
      response = await fetch("/api/login", { method: "POST", body: JSON.stringify(userInput) });
    } catch (err) {
      console.error(err);
    }

    if (!response.ok) {
      // handle error
      return;
    }

    return router.push("/homepage");
  };

  return (
    <Formik
      initialValues={{ name: "", email: "", password: "" }}
      validationSchema={Yup.object({
        name: Yup.string().required("Champ obligatoire"),
        email: Yup.string().email("Adresse email invalide").required("Champ obligatoire"),
        password: Yup.string().required("Champ obligatoire")
      })}
      onSubmit={handleSubmit}
    >
      {formik => (
        <Form className={styles.form}>
          <Field type="text" name="name" placeholder="Pseudo" />
          <ErrorMessage name="name">{msg => <div className={styles.errorText}>{msg}</div>}</ErrorMessage>
          <Field type="email" name="email" placeholder="Email" />
          <ErrorMessage name="email">{msg => <div className={styles.errorText}>{msg}</div>}</ErrorMessage>
          <Field type="password" name="password" placeholder="Mot de Passe" />
          <ErrorMessage name="password">{msg => <div className={styles.errorText}>{msg}</div>}</ErrorMessage>
          <button className={styles.btn} type="submit">S'inscrire</button>
        </Form>
      )}
    </Formik>

  );
}

//   action="/api/createUser" method="post">
//  onSubmit={handleSubmit} >