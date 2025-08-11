<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Vault"

    const descriptionMap = {
    0: "Financial technology services",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/vault/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
