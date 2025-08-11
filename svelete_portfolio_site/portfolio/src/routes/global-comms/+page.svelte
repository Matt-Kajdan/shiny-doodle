<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Global Comms"

    const descriptionMap = {
    0: "Telecommunications and networks",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/global-comms/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
