<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Smart Print"

    const descriptionMap = {
    0: "3D printing company",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/smart-print/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
