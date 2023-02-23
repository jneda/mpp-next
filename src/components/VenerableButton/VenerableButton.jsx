export default function DumbButton() {
  return (
    <button
      style={{
        color: "transparent",
        border: "16px solid hotpink"
      }}
      onClick={() => alert("coucou !")}
    ></button>
  );
}
