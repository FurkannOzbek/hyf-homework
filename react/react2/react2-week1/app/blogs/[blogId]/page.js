"use client";
import { usePathname } from "next/navigation";

export default function Blog() {
  const path = usePathname();
  const lastPartofPath = path?.split("/").pop();
  const formatWeWant = (word) => {
    return word
      .replace(/-/g, " ")
      .replace(/\b\w/g, (char) => char.toUpperCase()); // Capitalize the first letter of each word;
  };
  return <div> {formatWeWant(lastPartofPath)}</div>;
}
