<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Skarsken & König"

    const descriptionMap = {
    0: "Premium apparel",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/skarsken-konig/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
